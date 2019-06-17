library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
--------------------------------------------------------
entity gera_baudrate is -- Entradas e saidas com "gbd" no final
  
	generic (
--		N: integer := 4 
	);
	
	port(
		--------------in--------------
		clk_gbd         : in  std_logic;                    -- clock de 50M
		sel_baudrate_gbd: in  std_logic_vector(1 downto 0); -- chaves H selecionam o baudrate desejado. (4 possibilidades) 
		--------------out--------------
		baudrate_gbd    : out std_logic;
		led_baudrate_gbd: out std_logic_vector(3 downto 0)
	);
	
end entity;
--------------------------------------------------------
architecture ifsc of gera_baudrate is
	
begin
 	
end architecture;
--------------------------------------------------------



