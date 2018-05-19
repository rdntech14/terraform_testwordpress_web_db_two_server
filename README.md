This terraform creates following:

Purpose : To setup public accessibile wordpress suite with DB server on one instance and Web server on another instance 
and using terraform template concept update DB ip address on web server while setting up wordpress site.

1) Create Instance and setup SQL server
2) Get DP ip address
3) Update Dynamically generated DP ip address and update dp in in wordPRess shell script using terraform template.
4) Create an another instance to setup wordpress using user data passing shell script uodated with DP ip address.
