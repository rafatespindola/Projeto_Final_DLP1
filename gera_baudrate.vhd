library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
-----------------------------------------------------------
entity gera_baudrate is 											 -- Entradas e saidas com "gbd" no final
  
  port(
		--------------in--------------
		clk_gbd         : in std_logic;                    -- clock de 50M
		rst_gbd         : in std_logic;							-- para teste no modelsim
		sel_baudrate_gbd: in std_logic_vector(1 downto 0); -- chaves H selecionam o baudrate desejado. (4 possibilidades) 
		--------------out--------------
		baudrate_gbd     : out std_logic;
		led_baudrate_gbd1: out std_logic;
		led_baudrate_gbd2: out std_logic;
		led_baudrate_gbd3: out std_logic;
		led_baudrate_gbd4: out std_logic
	);
	
end entity;
----------------------------------------------------------
architecture ifsc of gera_baudrate is
	
	signal clk_9600: std_logic := '1'; 
	signal clk_1   : std_logic := '1';
	signal clk_05  : std_logic := '1';
	signal clk_025 : std_logic := '1'; 	

begin
	
	process(clk_gbd,rst_gbd, sel_baudrate_gbd) is

		variable cnt_9600: natural range 0 to 2604-1;
		variable cnt_1   : natural range 0 to 25000000-1;
		variable cnt_05  : natural range 0 to 50000000-1;
		variable cnt_025 : natural range 0 to 100000000-1;	
		
	begin	
		
		if(rst_gbd = '0' and rising_edge(clk_gbd)) then
			cnt_9600 :=  0;
			cnt_1    :=  0;
			cnt_05   :=  0;
			cnt_025  :=  0;
			clk_9600 <= '1';
			clk_1    <= '1';
			clk_05   <= '1';
			clk_025  <= '1';
			
		elsif (rising_edge(clk_gbd)) then
			if (cnt_9600 = 2604-1) then
				cnt_9600 := 0;
				clk_9600 <= not clk_9600;
			else
				cnt_9600 := cnt_9600 + 1;
			end if;
			
			if (cnt_1 = 25000000-1) then
				cnt_1 := 0;
				clk_1 <= not clk_1;
			else
				cnt_1 := cnt_1 + 1;
			end if;
			
			if (cnt_05 = 50000000-1) then
				cnt_05 := 0;
				clk_05 <= not clk_05;
			else
				cnt_05 := cnt_05 + 1;
			end if;
			
			if (cnt_025 = 100000000-1) then
				cnt_025 := 0;
				clk_025 <= not clk_025;
			else
				cnt_025 := cnt_025 + 1;
			end if;
			
			-- Acender o led de acordo com o baudarate escolhido
			if (sel_baudrate_gbd = "00") then
				led_baudrate_gbd1 <= '1';
				led_baudrate_gbd2 <= '0';
				led_baudrate_gbd3 <= '0';
				led_baudrate_gbd4 <= '0';	
			elsif (sel_baudrate_gbd = "01") then
				led_baudrate_gbd1 <= '0';
				led_baudrate_gbd2 <= '1';
				led_baudrate_gbd3 <= '0';
				led_baudrate_gbd4 <= '0';			
			elsif (sel_baudrate_gbd = "10") then
				led_baudrate_gbd1 <= '0';
				led_baudrate_gbd2 <= '0';
				led_baudrate_gbd3 <= '1';
				led_baudrate_gbd4 <= '0';			
			elsif (sel_baudrate_gbd = "11") then
				led_baudrate_gbd1 <= '0';
				led_baudrate_gbd2 <= '0';
				led_baudrate_gbd3 <= '0';
				led_baudrate_gbd4 <= '1';			
			end if;
		end if;
	end process;		
	
	with sel_baudrate_gbd select
	baudrate_gbd <= 
		clk_9600 when "00",
		clk_1    when "01",
		clk_05   when "10",
		clk_025  when others;
		
end architecture;
-----------------------------------------------------------

	