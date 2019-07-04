library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
--------------------------------------------------------
entity gerador_paridade is
	
	generic(N: natural:= 7);
	
	port(
		--------------in--------------
		entrada: in std_logic_vector(N-1 downto 0);
		sel_par: in std_logic;                           -- 0 -> paridade par e 1-> paridade impar
		--------------out--------------
		par_out: out std_logic
	);
	
end entity;
--------------------------------------------------------
architecture gerador_paridade_v1 of gerador_paridade is
	signal cont_out: integer;
begin

 	process(entrada)
		variable cont, resto: integer;
		begin
			cont := 0;
			for i in N-1 downto 0 loop
				if (entrada(i) = '1') then
					cont := cont +1;
				end if;
			end loop;
			resto := cont rem 2;
			cont_out <= resto;
		end process;
		par_out <=
			'0' when sel_par ='0' AND cont_out = 0 else
			'1' when sel_par ='0' AND cont_out = 1 else
			'0' when sel_par ='1' AND cont_out = 1 else
			'0';
end gerador_paridade_v1;
--------------------------------------------------------



