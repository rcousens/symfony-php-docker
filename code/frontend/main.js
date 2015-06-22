import _ from 'lodash';
import $ from 'jquery';
import m from 'mithril.js';

export const thisIsDumb = null;

//this application only has one component: todo
var todo = {};

//for simplicity, we use this component to namespace the model classes

//the Todo class has two properties
todo.Todo = function(data) {
    this.description = m.prop(data.description);
    this.done = m.prop(false);
};

//the TodoList class is a list of Todo's
todo.TodoList = Array;

//the view-model tracks a running list of todos,
//stores a description for new todos before they are created
//and takes care of the logic surrounding when adding is permitted
//and clearing the input after adding a todo to the list
todo.vm = (function() {
    var vm = {};
    vm.init = function() {
        //a running list of todos
        vm.list = new todo.TodoList();

        //a slot to store the name of a new todo before it is created
        vm.description = m.prop("");

        //adds a todo to the list, and clears the description field for user convenience
        vm.add = function() {
            if (vm.description()) {
                vm.list.push(new todo.Todo({description: vm.description()}));
                vm.description("");
            }
        };
    };
    return vm
}());

//the controller defines what part of the model is relevant for the current page
//in our case, there's only one view-model that handles everything
todo.controller = function() {
    todo.vm.init()
};

//here's the view
todo.view = function() {
    return (
    <html>
        <body>
        <input onchange={m.withAttr("value", todo.vm.description)} value={todo.vm.description()} />
        <button onclick={todo.vm.add}>Add</button>
        <table>
            {todo.vm.list.map(function(task, index) {
                return (<tr><td><input type="checkbox" onclick={m.withAttr("checked", task.done)} /></td><td style={{textDecoration: task.done() ? "line-through" : "none"}}>{task.description()} </td></tr>);
            })}
        </table>
        </body>
    </html>
    );
};

//initialize the application
m.mount(document, {controller: todo.controller, view: todo.view});


