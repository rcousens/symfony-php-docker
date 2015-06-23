import m from 'mithril.js';
import { todo } from '../todo/todo';

var homeComponent = {};

//the controller defines what part of the model is relevant for the current page
//in our case, there's only one view-model that handles everything
homeComponent.controller = function() {
};

//here's the view
homeComponent.view = function() {
    return (
        <div class="container">

            <div class="starter-template">
                <h1>What do?</h1>
                <div>
                    {todo}
                </div>
            </div>

        </div>
    );
};

export { homeComponent as home };


