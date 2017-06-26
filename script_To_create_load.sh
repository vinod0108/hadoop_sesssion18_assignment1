#!/bin/bash

# Declaring Variables
table0="customer"

# Creating a Employee table in HBase

echo "exists '$table0'" | hbase shell > log
cat log | grep "Table employee does exist"
if [ $? = 0 ];then
    echo "************  table is already exists **********"
	
# Either you can use truncate or disable & drop options

    echo "disable '$table0'" | hbase shell
    echo "drop '$table0'" | hbase shell

# Creating, copying and populating the table0 table
   echo "***********  need to create a table  **********"
    echo "create '$table0','id','name','location','age'" | hbase shell

echo $(hadoop fs -copyFromLocal /tmp/cutomer.dat /hbase/table0)
echo $(hbase org.apache.hadoop.hbase.mapreduce.Import table0 /hbase/table0)
echo $(hadoop fs -rmr /hbase)
exit
	
	
	
	

