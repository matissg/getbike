/*jshint esversion: 6 */
import $ from 'jquery';
window.jQuery = $;
window.$ = $;
// Bootstrap
import 'bootstrap/dist/js/bootstrap';
// Daterangepicker
require( 'daterangepicker' );
import moment from 'moment';
window.moment = moment;

// App
import 'src/delete_confirm.js';
import 'src/rides.js';
// Rails UJS
import {} from 'jquery-ujs';
// Turbolinks
require("turbolinks").start();
// CSS
import 'src/application.scss';


$(document).on('turbolinks:load', function() {

  setTimeout(function() {
    $('#flash').slideUp();
  }, 5000);

});
