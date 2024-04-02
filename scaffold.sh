docker-compose exec web rails generate scaffold Region name:string code:string
docker-compose exec web rails generate scaffold District name:string code:string region:references
docker-compose exec web rails generate scaffold FireDepartment name:string code:string district:references address:string
#docker-compose exec web rails generate scaffold Member first_name:string last_name:string birthdate:date address:string email:string phone:string member_code:string role:string
docker-compose exec web rails generate scaffold FireDepartmentMembership start_date:date fire_department:references member:references role:integer status:integer
docker-compose exec web rails generate scaffold Award name:string award_kind:integer dependent_on_award:integer minimum_service_years:integer minimum_age_for_award:integer
docker-compose exec web rails generate migration AddMemberDetailsToAccounts first_name:string last_name:string birthdate:date address:string phone:string member_code:string role:string




