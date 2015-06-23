import _ from 'lodash';
import $ from 'jquery';
import m from 'mithril.js';
import bootstrap from 'bootstrap';
import 'bootstrap/css/bootstrap.css!';
import '../styles/main.css!';
import { todo } from './component/todo/todo'

m.mount($('#todo')[0], {controller: todo.controller, view: todo.view});

