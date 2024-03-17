# ssd wearing

```sh
root@tuf:~# smartctl -a /dev/sda
...

SMART Attributes Data Structure revision number: 1
Vendor Specific SMART Attributes with Thresholds:
ID# ATTRIBUTE_NAME          FLAG     VALUE WORST THRESH TYPE      UPDATED  WHEN_FAILED RAW_VALUE
  5 Reallocated_Sector_Ct   0x0033   100   100   010    Pre-fail  Always       -       0
  9 Power_On_Hours          0x0032   096   096   000    Old_age   Always       -       16965
 12 Power_Cycle_Count       0x0032   095   095   000    Old_age   Always       -       5030
177 Wear_Leveling_Count     0x0013   097   097   000    Pre-fail  Always       -       39
179 Used_Rsvd_Blk_Cnt_Tot   0x0013   100   100   010    Pre-fail  Always       -       0
181 Program_Fail_Cnt_Total  0x0032   100   100   010    Old_age   Always       -       0
182 Erase_Fail_Count_Total  0x0032   100   100   010    Old_age   Always       -       0
183 Runtime_Bad_Block       0x0013   100   100   010    Pre-fail  Always       -       0
187 Uncorrectable_Error_Cnt 0x0032   100   100   000    Old_age   Always       -       0
190 Airflow_Temperature_Cel 0x0032   077   054   000    Old_age   Always       -       23
195 ECC_Error_Rate          0x001a   200   200   000    Old_age   Always       -       0
199 CRC_Error_Count         0x003e   100   100   000    Old_age   Always       -       0
235 POR_Recovery_Count      0x0012   099   099   000    Old_age   Always       -       218
241 Total_LBAs_Written      0x0032   099   099   000    Old_age   Always       -       123734404809
...
```

- `Wear_Leveling_Count` starts from 100 and decrease to 0 when wear level is critical

- `Total_LBAs_Written` / 2 / 1024 / 1024 / 1024 gives the TBw ( in my case = 57.6 TBw ) ; for this disk model type there is ensured for 1200TBw max ( actually about 5% wearing )
