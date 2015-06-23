import m from 'mithril.js';

//this application only has one component: todo
var todoComponent = {};

//for simplicity, we use this component to namespace the model classes

//the Todo class has two properties
todoComponent.Todo = function(data) {
    this.description = m.prop(data.description);
    this.done = m.prop(false);
};

//the TodoList class is a list of Todo's
todoComponent.TodoList = Array;

//the view-model tracks a running list of todos,
//stores a description for new todos before they are created
//and takes care of the logic surrounding when adding is permitted
//and clearing the input after adding a todo to the list
todoComponent.vm = (function() {
    var vm = {};
    vm.init = function() {
        //a running list of todos
        vm.list = new todoComponent.TodoList();

        //a slot to store the name of a new todo before it is created
        vm.description = m.prop("");

        //adds a todo to the list, and clears the description field for user convenience
        vm.add = function() {
            if (vm.description()) {
                vm.list.push(new todoComponent.Todo({description: vm.description()}));
                vm.description("");
            }
        };
    };
    return vm
}());

//the controller defines what part of the model is relevant for the current page
//in our case, there's only one view-model that handles everything
todoComponent.controller = function() {
    todoComponent.vm.init()
};

//here's the view
todoComponent.view = function() {
    var todoList = todoComponent.vm.list.map(function(task, index) {
        return (<tr><td><input type="checkbox" onclick={m.withAttr("checked", task.done)} /></td><td style={{textDecoration: task.done() ? "line-through" : "none"}}>{task.description()} </td></tr>);
    });

    return (
        <div>
            <input onchange={m.withAttr("value", todoComponent.vm.description)} value={todoComponent.vm.description()} />
            <button onclick={todoComponent.vm.add}>Add</button>
            <table>
                {todoList}
            </table>
        </div>
    );
};

export { todoComponent as todo };