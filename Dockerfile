FROM ruby:3.3-bookworm

# Aktualizace seznamu balíčků a instalace závislostí pro Rails
RUN apt-get update -qq && apt-get install -y nodejs yarn sqlite3 libsqlite3-dev libmagickwand-dev imagemagick sassc

# Nastavení pracovního adresáře v kontejneru
WORKDIR /app

# Instalace gemu bundler
RUN gem install bundler

# Kopírování Gemfile a Gemfile.lock pro nainstalování závislostí
COPY Gemfile Gemfile.lock ./

# Instalace gemů
RUN bundle install

# Kopírování zdrojových souborů do kontejneru
COPY . .

# Spuštění serveru
CMD ["rails", "server", "-b", "0.0.0.0"]
#CMD ["/app/start.sh"]
#CMD ["./start.sh"]