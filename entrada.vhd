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
		msg : in String := "teste123";
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
		load_saida : out std_logic_vector(6 downto 0) -- Saida para conversor serial apos traducao
	);
	
end entity;
--------------------------------------------------------
architecture ifsc of entrada is
	type ssd_array is array (7 downto 0) of std_logic_vector(6 downto 0); -- Array de caracteres ASCII
	signal ssd: ssd_array;
begin
 	
end architecture;
--------------------------------------------------------



