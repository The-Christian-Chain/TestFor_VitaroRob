require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require('jquery')

import '../stylesheets/application'
import 'bootstrap'

document.addEventListener("turbolinks:load", () => {
    $('[data-toggle="tooltip"]').tooltip()
    $('[data-toggle="popover"]').popover()

})

//  Custom Scripts
require("custom/global")