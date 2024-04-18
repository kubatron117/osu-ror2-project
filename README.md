# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* How to start(run) project:
  * create .env from .env-template
  * docker-compose build
  * docker-compose up
  * ./db.sh (setup db with seed)
  * ./css.sh (to build css)
  * Seed generuje náhodné uživatele, pro přihlášení je potřeba se přihlásit nějakým se superadminem a heslo pro něj je: heslo123!

* Ruby version
  * 3.3.0 

* System dependencies
  * Docker
  * Docker Compose

* Configuration

* Database creation

* Database initialization
  * ./db.sh (need to be docker-compose up)

* How to run the test suite
  * .rails.sh rspec spec/models 
  * .rails.sh rspec spec/requests/api/v1 
  * .rails.sh rspec spec/requests/api/v1 

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

## Domácí úloha:
1. řešeno - /app/models
2. řešeno - /app/controllers/api/v1
   * token - app/controllers/application_controller.rb:21
   1. řešeno - /app/controllers/api/v1/fire_departments_controller.rb
   2. řešeno - app/controllers/api/v1/members_controller.rb
      1. POST: {"member":{ "email": "testapi289@example.com", "first_name": "John", "last_name": "Doe", "member_code": "13202","role": 1, "birthdate": "13.04.2024", "address": "asdasd", "phone": "782527" } }
3. řešeno - soubor_name:row_number
   1. řešeno - spec/models
   2. řešeno - spec/requests/api/v1

## Projekt:
1. Prezentace
2. řešeno - app/views
3. řešeno - pomocí ransack (ve všech controllers pro index a k tomu odpovídající views)
4. řešeno - db/seeds.rb
5. řešeno - app/controllers/account_awards_controller.rb:26
6. řešeno - app/views/regions/index.html.erb:40
7. řešeno - app/services/add_award_to_member_service.rb
   1. řešeno - app/services/add_award_to_member_service.rb
   2. řešeno - spec/services/add_award_to_member_service_spec.rb
8. řešeno - app/controllers/api/v1/account_awards_controller.rb
   1. řešeno - app/controllers/api/v1/account_awards_controller.rb
   2. řešeno - spec/requests/api/v1/fire_departments_spec.rb
9. řešeno
   1. neřešeno
   2. neřešeno
   3. řešeno - app/javascript/controllers/index.js:13


### Others:
School project for subject: PRRR2 - Ruby on Rails 2
2024/LS 

Author: Jakub Pryček


MIT License

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.