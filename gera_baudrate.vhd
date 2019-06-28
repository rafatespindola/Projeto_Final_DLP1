library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
--------------------------------------------------------
entity gera_baudrate is -- Entradas e saidas com "gbd" no final
  
	generic (
		N: integer := 4 
	);
	
	port(
		--------------in--------------
		clk_gbd         : in  std_logic;                    -- clock de 50M
		sel_baudrate_gbd: in  std_logic_vector(1 downto 0); -- chaves H selecionam o baudrate desejado. (4 possibilidades) 
		--------------out--------------
		baudrate_gbd    : out std_logic;
		led_baudrate_gbd1: out std_logic;
		led_baudrate_gbd2: out std_logic;
		led_baudrate_gbd3: out std_logic;
		led_baudrate_gbd4: out std_logic
	);
	
end entity;
--------------------------------------------------------
architecture ifsc of gera_baudrate is
	
begin
 	
end architecture;
--------------------------------------------------------



