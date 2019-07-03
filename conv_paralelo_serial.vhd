library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
--------------------------------------------------------
entity conv_paralelo_serial is                         -- Entradas e saidas com "conv" no final
  
	generic (N: integer := 4 );
	
	port(
		--------------in--------------
		sel_par_conv : in  std_logic;
		ascii_conv   : in  std_logic_vector(6 downto 0); -- palavra em formato ascii chegando  
		--------------out--------------
		out_ent      : out std_logic_vector(10 downto 0) -- Saida com o caractere e mais os bits de controle. No total 11 bits por caractere
	);
	
end entity;
--------------------------------------------------------
architecture ifsc of conv_paralelo_serial is
	
	component gerador_paridade
		generic(N: natural:= 7);
		port(
			--------------in--------------
			entrada: in std_logic_vector(N-1 downto 0);
			sel_par: in std_logic;                       -- 0 paridade par| 1 paridade impar
			--------------out--------------
			par_out: out std_logic
		);
	end component;
	
	signal par_conv: std_logic;
	
begin

	paridade: gerador_paridade
		generic map(N=> 7)
		port map(entrada => ascii_conv, sel_par => sel_par_conv, par_out => par_conv);
		
	out_ent <= "11" & par_conv & ascii_conv & '0';
	
end architecture;
--------------------------------------------------------



