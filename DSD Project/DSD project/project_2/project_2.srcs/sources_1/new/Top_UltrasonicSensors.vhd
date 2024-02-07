library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Top_UltrasonicSensors is
    Port ( clk : in STD_LOGIC;
           Echo_V : in STD_LOGIC_VECTOR (3 downto 0);
           AC_LED : in STD_LOGIC_VECTOR (2 downto 0); -- Bit2: Red Light, Bit1: Yellow Light, Bit0: Green Light
           BD_LED : in STD_LOGIC_VECTOR (2 downto 0); -- Bit2: Red Light, Bit1: Yellow Light, Bit0: Green Light
           Buzz_Out : out STD_LOGIC;
           Trigger : out STD_LOGIC);
end Top_UltrasonicSensors;

architecture Behavioral of Top_UltrasonicSensors is
    
    component TriggerGen is 
        Port(
            clk : in  STD_LOGIC;
            trigger : out  STD_LOGIC
            );
    end component;

    component HCRS04 is
        Port(
            clk : in  STD_LOGIC;
            echo : in  STD_LOGIC;
            RedState : in STD_LOGIC;
            Trigger : in  STD_LOGIC;
            Buzz: out STD_LOGIC
            );
    end component;
    
    component OR_Gate is
        Port ( OR_IN : in STD_LOGIC_VECTOR(3 downto 0);
               OR_OUT : out STD_LOGIC);
    end component;
    
    signal OR_Signals : STD_LOGIC_VECTOR (3 downto 0);
    signal TriggerSignal : STD_LOGIC; 

begin

Inst_Trigger_Gen: TriggerGen port map (
            clk => clk,
            trigger => TriggerSignal
            );

Inst_Ultra1_AC: HCRS04 port map (
            clk => clk,
            echo => Echo_V(3),
            RedState => AC_LED(2),
            Trigger => TriggerSignal,
            Buzz => OR_Signals(3)
            );

Inst_Ultra2_AC: HCRS04 port map (
            clk => clk,
            echo => Echo_V(2),
            RedState => AC_LED(2),
            Trigger => TriggerSignal,
            Buzz => OR_Signals(2)
            );
            
Inst_Ultra1_BD: HCRS04 port map (
            clk => clk,
            echo => Echo_V(1),
            RedState => BD_LED(2),
            Trigger => TriggerSignal,
            Buzz => OR_Signals(1)
            );
            
Inst_Ultra2_BD: HCRS04 port map (
            clk => clk,
            echo => Echo_V(0),
            RedState => BD_LED(2),
            Trigger => TriggerSignal,
            Buzz => OR_Signals(0)
            );
            
Inst_OR_Gate: OR_Gate port map (
            OR_IN => OR_Signals,
            OR_OUT => Buzz_Out
            );
        Trigger <= TriggerSignal;
            
end Behavioral;
