library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
--------------------------------------------------------
entity entrada is -- Entradas e saidas com "ent" no final
  
	generic (
		N: natural:= 8
	);
	
	port(
		--------------in--------------
		clk_ent  : in  std_logic;
		load_ent : in  std_logic; -- button para carregar a palavra ao conversor serial
		msg : in String (1 to 8):= "teste123";
		--------------out--------------
		--ssd1_ent : out std_logic_vector(6 downto 0); -- Primeiro display
		--ssd2_ent : out std_logic_vector(6 downto 0); -- Segundo  display
		--ssd3_ent : out std_logic_vector(6 downto 0); -- Terceiro display
		--ssd4_ent : out std_logic_vector(6 downto 0); -- Quarto   display
		--ssd5_ent : out std_logic_vector(6 downto 0); -- Quinto   display
		--ssd6_ent : out std_logic_vector(6 downto 0); -- Sexto    display
		--ssd7_ent : out std_logic_vector(6 downto 0); -- Setimo   display
		--ssd8_ent : out std_logic_vector(6 downto 0); -- Oitavo   display	
		--ascii_ent: out std_logic_vector(6 downto 0)  -- Caractere unico traduzido para ASCII
		load_sai : out std_logic_vector(6 downto 0) -- Saida para conversor serial apos traducao
	);
	
end entity;
--------------------------------------------------------
architecture ifsc of entrada is
	type ssd_array is array (7 downto 0) of std_logic_vector(6 downto 0); -- Array de caracteres ASCII
	signal ssd: ssd_array;
begin
	
	process(msg) is
		variable char_to_bin: std_logic_vector(0 to 6);
		variable c: character;
		begin
			for i in 1 to 8 loop
			c := msg(i);
				case c is
					when 'A' => char_to_bin := "1000001";
					when 'b' => char_to_bin := "1100010";
					when 'C' => char_to_bin := "1000011";
					when 'd' => char_to_bin := "1100100";
					when 'E' => char_to_bin := "1000101";
					when 'F' => char_to_bin := "1000110";
					when 'G' => char_to_bin := "1000111";
					when 'H' => char_to_bin := "1001000";
					when 'I' => char_to_bin := "1001001";
					when 'J' => char_to_bin := "1001010";
					when 'L' => char_to_bin := "1001100";
					when 'O' => char_to_bin := "1001111";
					when 'P' => char_to_bin := "1010000";
					when 'S' => char_to_bin := "1010011";
					when 'U' => char_to_bin := "1010101";
					when others => char_to_bin := "0000000";
				end case;
				ssd(i-1)<= char_to_bin;
			end loop;
end process;
 	
end architecture;
--------------------------------------------------------



