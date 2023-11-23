DAG <- dagitty('dag {
bb="-3.687,-2.637,5.96,2.575"
age [adjusted,pos="-0.929,-0.900"]
altitude_cat [pos="4.259,0.627"]
atelectasis_percent [outcome,pos="-0.258,-2.137"]
hb [pos="-0.789,2.123"]
sex [adjusted,pos="-2.995,-0.744"]
sleep_apnea [adjusted,pos="0.108,0.783"]
spo2_VPO [outcome,pos="2.079,0.078"]
type_obesity [exposure,pos="-2.883,0.520"]
age -> atelectasis_percent
age -> hb
age -> sleep_apnea
age -> spo2_VPO
age -> type_obesity
altitude_cat -> atelectasis_percent
altitude_cat -> hb
altitude_cat -> sleep_apnea
altitude_cat -> spo2_VPO
atelectasis_percent -> hb
atelectasis_percent -> spo2_VPO
hb -> spo2_VPO
sex -> atelectasis_percent
sex -> hb
sex -> sleep_apnea
sex -> spo2_VPO
sex -> type_obesity
sleep_apnea -> atelectasis_percent
sleep_apnea -> spo2_VPO
sleep_apnea -> type_obesity
type_obesity -> atelectasis_percent
type_obesity -> spo2_VPO
}
')
