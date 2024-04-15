// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener('DOMContentLoaded', function () {
    const dropdownToggles = document.querySelectorAll('.dropdown');

    dropdownToggles.forEach(function (toggle) {
        toggle.addEventListener('click', function () {
            const dropdownMenu = this.querySelector('.dropdown-menu');
            dropdownMenu.classList.toggle('hidden');
        });
    });

    document.addEventListener('click', function (event) {
        dropdownToggles.forEach(function (toggle) {
            const dropdownMenu = toggle.querySelector('.dropdown-menu');
            if (!toggle.contains(event.target) && !dropdownMenu.classList.contains('hidden')) {
                dropdownMenu.classList.add('hidden');
            }
        });
    });
});
