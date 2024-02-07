---------------------- TriggerGen ----------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity TriggerGen is
    generic (n: integer := 25);
    Port(
        clk : in  STD_LOGIC;
        trigger : out  STD_LOGIC
        );
end TriggerGen;

architecture Behavioral of TriggerGen is

    signal tick: std_logic_vector(n-1 downto 0) := (others =>'0');
    constant nclks: integer := 3850000; -- or 4000000 = 40e-3 s * 100e6 hz; --it corresponds to 40ms to repeat trigger
    
begin
    process (clk) begin
        if clk'event and clk = '1' then
            if tick < nclks then
                tick <= tick + 1;
            else
                tick <= (others => '0');
            end if;
        end if;
    end process;
    trigger <= '1' when (tick < 1250) else '0'; -- 1000 = 10e-6 s * 100e6 hz; -- it corresponds to 10 microseconds 
end behavioral;