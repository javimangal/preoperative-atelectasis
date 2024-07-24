DAG <- dagitty('dag {
bb="-3.216,-2.051,2.758,2.229"
COPD [pos="-2.105,1.675"]
CPAP_use [pos="2.228,0.203"]
age [adjusted,pos="-2.860,0.010"]
altitude_cat [adjusted,pos="1.038,1.719"]
asthma [pos="-1.107,1.930"]
atelectasis_percent [outcome,pos="-0.316,-1.093"]
oxygen_use [pos="1.981,1.166"]
sex [adjusted,pos="-2.741,0.862"]
sleep_apnea [pos="0.225,1.948"]
spo2_VPO [pos="1.989,-1.067"]
type_obesity [exposure,pos="-2.588,-1.067"]
COPD -> CPAP_use
COPD -> atelectasis_percent
COPD -> oxygen_use
COPD -> spo2_VPO
age -> COPD
age -> CPAP_use
age -> atelectasis_percent
age -> oxygen_use
age -> sleep_apnea
age -> spo2_VPO
age -> type_obesity
altitude_cat -> COPD
altitude_cat -> CPAP_use
altitude_cat -> asthma
altitude_cat -> atelectasis_percent
altitude_cat -> oxygen_use
altitude_cat -> sleep_apnea
altitude_cat -> spo2_VPO
altitude_cat -> type_obesity
asthma -> COPD
asthma -> CPAP_use
asthma -> atelectasis_percent
asthma -> oxygen_use
asthma -> spo2_VPO
atelectasis_percent -> CPAP_use
atelectasis_percent -> oxygen_use
atelectasis_percent -> spo2_VPO
oxygen_use -> CPAP_use
sex -> COPD
sex -> CPAP_use
sex -> asthma
sex -> atelectasis_percent
sex -> oxygen_use
sex -> sleep_apnea
sex -> spo2_VPO
sex -> type_obesity
sleep_apnea -> COPD
sleep_apnea -> CPAP_use
sleep_apnea -> asthma
sleep_apnea -> atelectasis_percent
sleep_apnea -> oxygen_use
sleep_apnea -> spo2_VPO
spo2_VPO -> CPAP_use
spo2_VPO -> oxygen_use
type_obesity -> CPAP_use
type_obesity -> asthma
type_obesity -> atelectasis_percent
type_obesity -> oxygen_use
type_obesity -> sleep_apnea
type_obesity -> spo2_VPO [pos="-0.371,-2.042"]
}
'
)
