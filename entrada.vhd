library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
--------------------------------------------------------
entity entrada is 							   			   -- Entradas e saidas com "ent" no final

	generic (N: natural:= 8);
	port(
		--------------in--------------
		clk_ent  : in  std_logic;
		enable_ent: in  std_logic;                       -- chave H p carregar a palavra ao conversor serial
		load_ent : in std_logic;
		msg      : in String (1 to 8):= "dLP12345";
		--------------out--------------
		ssd1_ent : out std_logic_vector(6 downto 0);    -- Primeiro display
		ssd2_ent : out std_logic_vector(6 downto 0);    -- Segundo  display
		ssd3_ent : out std_logic_vector(6 downto 0);    -- Terceiro display
		ssd4_ent : out std_logic_vector(6 downto 0);    -- Quarto   display
		ssd5_ent : out std_logic_vector(6 downto 0);    -- Quinto   display
		ssd6_ent : out std_logic_vector(6 downto 0);    -- Sexto    display
		ssd7_ent : out std_logic_vector(6 downto 0);    -- Setimo   display
		ssd8_ent : out std_logic_vector(6 downto 0);    -- Oitavo   display	
		load_out_ent : out std_logic_vector(6 downto 0) -- Saida para conversor serial apos traducao
	);
	
end entity;
--------------------------------------------------------
architecture ifsc of entrada is
	type ssd_array is array (7 downto 0) of std_logic_vector(6 downto 0); -- Array de caracteres ASCII
	signal ssd: ssd_array;
	signal pulso: std_logic := '0';
begin	

	process(msg) is
		variable char_to_ssd: std_logic_vector(6 downto 0);
		variable c: character;
		begin
			for i in 1 to 8 loop
			c := msg(i);
				case c is
					when 'A' => char_to_ssd := "1110111";
					when 'b' => char_to_ssd := "0011111";
					when 'C' => char_to_ssd := "1001110";
					when 'd' => char_to_ssd := "1011110";
					when 'E' => char_to_ssd := "1001111";
					when 'F' => char_to_ssd := "1000111";
					when 'G' => char_to_ssd := "1011110";
					when 'H' => char_to_ssd := "0110111";
					when 'I' => char_to_ssd := "0000110";
					when 'J' => char_to_ssd := "0111100";
					when 'L' => char_to_ssd := "0111000";
					when 'O' => char_to_ssd := "1111110";
					when 'P' => char_to_ssd := "1110011";
					when 'S' => char_to_ssd := "1011011";
					when 'U' => char_to_ssd := "0111110";
					when '0' => char_to_ssd := "1111110";
					when '1' => char_to_ssd := "0000110";
					when '2' => char_to_ssd := "1011011";
					when '3' => char_to_ssd := "1001111";
					when '4' => char_to_ssd := "1100110";
					when '5' => char_to_ssd := "1101101";
					when '6' => char_to_ssd := "1011111";
					when '7' => char_to_ssd := "1110000";
					when '8' => char_to_ssd := "1111111";
					when '9' => char_to_ssd := "1110011";
					when others => char_to_ssd := "0000001";
				end case;
				ssd(i-1)<= not char_to_ssd;
			end loop;
	end process;
	
		ssd1_ent <= ssd(0);
		ssd2_ent <= ssd(1);
		ssd3_ent <= ssd(2);
		ssd4_ent <= ssd(3);
		ssd5_ent <= ssd(4);
		ssd6_ent <= ssd(5);
		ssd7_ent <= ssd(6);
		ssd8_ent <= ssd(7);
	
	--Criando pulso de load
	process (clk_ent, load_ent) is
		variable flag: integer range 0 to 1 := 0;
	begin
		if(rising_edge(clk_ent)) then
			if (load_ent = '1' and flag = 0) then
				pulso <= '1';
				flag  :=  1;
			elsif (load_ent = '1' and flag = 1) then
				pulso <= '0';
			elsif (load_ent = '0') then
				flag   :=  0;
			end if;
		end if;
	end process;
	
	process(clk_ent, enable_ent) is 
		variable cont: integer range 1 to 8:= 1; 
		variable cont2: integer range 0 to 11:= 11; -- contador migue
		variable letra_slv: std_logic_vector(6 downto 0);
		variable char: character;
	begin 
		if(rising_edge(clk_ent) and enable_ent = '1') then
			char := msg(cont);
			letra_slv := std_logic_vector(to_unsigned(character'pos(char),7));
			load_out_ent <= letra_slv;
			if (pulso = '1') then
				load_out_ent <= letra_slv;
				cont2:= 0;
			end if;
			if(cont2 = 10) then
				if (cont < 8) then
					cont := cont + 1;
					cont2 := 11;
				else
					cont := 1;
				end if;
			elsif(cont2 /= 11) then
				cont2 := cont2 + 1;
			else
				cont2 := 11;
			end if;
		end if;
	end process;
	
end architecture;
--------------------------------------------------------