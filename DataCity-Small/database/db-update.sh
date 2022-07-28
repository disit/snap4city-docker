#update the wizard table to set the new added columns

docker-compose exec -T dashboarddb mysql -u user -ppasswordx < dashboard-wizard-update01.sql

