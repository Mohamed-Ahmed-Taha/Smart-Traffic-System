------------------------------------ distance_calculation  -------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;


entity DistanceCalc is
    port(
         echo_count : in STD_LOGIC_VECTOR (24 downto 0);
         echo : in STD_LOGIC;
         distance : out  STD_LOGIC_VECTOR (31 downto 0)
         );
end DistanceCalc;

architecture Behavioral of DistanceCalc is

    constant speed_of_sound : real := 34300.0; -- Speed of sound in air in centimeters/second
    constant clock_frequency : real := 100000000.0; -- Clock frequency in
--    constant half_periodic_time : integer := 5e-9; -- Clock frequency in 
    signal distance_value : real := 0.0;
    signal tick_count : real := 0.0;

    
begin

    process(echo)
    begin       
        if echo'event and echo = '0' then
            tick_count <= real(conv_integer(echo_count));
            -- Calculate distance when echo goes low
            distance_value <= (tick_count) * speed_of_sound / (2.0 * clock_frequency);
            -- Output distance as a 16-bit vector
            distance <= std_logic_vector(to_unsigned(integer(distance_value), 32));
--            distance_value <= std_logic_vector(to_unsigned(integer(distance_value), 32));
--            distance <= distance_value; -- Output distance as a 32-bit vector

         end if;
    end process;

end Behavioral;
