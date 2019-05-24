import flatpickr from "flatpickr"
import "flatpickr/dist/themes/airbnb.css" // A path to the theme CSS

flatpickr(".datepicker", {
  minDate: "today",
  dateFormat: "Y-m-d"
})

