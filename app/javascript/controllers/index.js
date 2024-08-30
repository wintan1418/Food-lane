// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
import TimetableFormController from "./timetable_form_controller"
application.register("timetable-form", TimetableFormController)
eagerLoadControllersFrom("controllers", application)
