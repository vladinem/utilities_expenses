// app/assets/javascripts/application.js
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

document.addEventListener('DOMContentLoaded', function () {
  function updateTime() {
    var now = new Date();
    var formattedDate = now.toLocaleString('ru-RU', {
      day: '2-digit',
      month: '2-digit',
      year: 'numeric',
      hour: '2-digit',
      minute: '2-digit',
      second: '2-digit'
    });
    document.getElementById('current-date').textContent = 'Текущая дата: ' + formattedDate;
  }

  updateTime();
  setInterval(updateTime, 1000); // Обновление времени каждую секунду
});
import Rails from "@rails/ujs"
Rails.start()
import "@hotwired/turbo-rails"
