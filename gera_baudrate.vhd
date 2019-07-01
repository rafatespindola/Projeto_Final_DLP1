library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
--------------------------------------------------------
entity gera_baudrate is -- Entradas e saidas com "gbd" no final
  
  port(
		--------------in--------------
		clk_gbd         : in  std_logic;                    -- clock de 50M
		sel_baudrate_gbd: in  std_logic_vector(1 downto 0); -- chaves H selecionam o baudrate desejado. (4 possibilidades) 
		--------------out--------------
		baudrate_gbd     : out std_logic;
		led_baudrate_gbd1: out std_logic;
		led_baudrate_gbd2: out std_logic;
		led_baudrate_gbd3: out std_logic;
		led_baudrate_gbd4: out std_logic
	);
	
end entity;
--------------------------------------------------------
architecture ifsc of gera_baudrate is
	
	signal N_9600: natural := 2604; 
	signal N_1   : natural := 25000000;
	signal N_05  : natural := 50000000;
	signal N_025 : natural := 100000000;
	signal div: natural;
	
	signal tmp : std_logic := '1';
	
begin
	
	with sel_baudrate_gbd select
		div <= 
			N_9600 when "00",
			N_1    when "01",
			N_05   when "10",
			N_025  when others;

	process(clk_gbd) is
		variable cnt: natural range 0 to div-1;

	begin
			if (rising_edge(clk_gbd)) then
				if (cnt = div-1) then
					cnt :=0;
					tmp <= not tmp;
				else
					cnt := cnt + 1;
				end if;
			end if;
			baudrate_gbd <= tmp;
			end process;		
		
end architecture;
--------------------------------------------------------