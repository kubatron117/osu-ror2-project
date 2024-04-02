docker-compose exec web rails g scaffold Genre name:string:uniq
docker-compose exec web rails g scaffold Movie name:string original_name:string genre:references rating_score:float poster_path:string description:text
docker-compose exec web rails g scaffold Director first_name:string last_name:string
docker-compose exec web rails g scaffold Writer first_name:string last_name:string
docker-compose exec web rails g scaffold Actor first_name:string last_name:string
docker-compose exec web rails g scaffold Producer first_name:string last_name:string
docker-compose exec web rails g scaffold Editor first_name:string last_name:string
docker-compose exec web rails g scaffold Rating rating:integer comment:text account:references movie:references
docker-compose exec web rails g scaffold Country name:string
docker-compose exec web rails g scaffold Vod name:string link:string movie:references
docker-compose exec web rails g scaffold Premier name:string date:date movie:references
docker-compose exec web rails g migration CreateJoinTableMovieGenre movie genre
docker-compose exec web rails g migration CreateJoinTableMovieCountry movie country
docker-compose exec web rails g migration CreateJoinTableMovieDirector movie director
docker-compose exec web rails g migration CreateJoinTableMovieWriter movie writer
docker-compose exec web rails g migration CreateJoinTableMovieActor movie actor
docker-compose exec web rails g migration CreateJoinTableMovieProducer movie producer
docker-compose exec web rails g migration CreateJoinTableMovieEditor movie editor