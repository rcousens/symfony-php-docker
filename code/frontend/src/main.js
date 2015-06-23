import _ from 'lodash';
import $ from 'jquery';
import m from 'mithril.js';
import bootstrap from 'bootstrap';

import 'bootstrap/css/bootstrap.css!';
import '../styles/main.css!';

import { nav } from './component/nav/nav';

m.mount(document.body, {controller: nav.controller, view: nav.view});

