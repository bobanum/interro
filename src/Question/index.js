import {Formponent} from "../Webponent.js";

/**
 * Represents the Question component.
 * @extends Formponent
 */
export default class Question extends Formponent {
    /**
     * The tag name of the Question component.
     * @type {string}
     */
    static tagName = 'question-ponent';

    /**
     * The template file for the Question component. (optional)
     * @type {string}
     */
    // static templateUrl = 'index.tpl';
    // static styleUrl = "style.css";

    constructor() {
        super();
    }

    /**
     * Called when the Question component is connected to the DOM.
     * @override
     */
    connectedCallback() {
        super.connectedCallback();
        this.shadowRoot.appendChild(this.DOM.main());
        return;
    }
    DOM = {
        main: () => {
            return this.DOM.fieldSolutions();
        },
        field: (labelText, id, field) => {
            const result = document.createElement("div");
            result.classList.add("field");
            result.classList.add(id);
            const label = result.appendChild(document.createElement("label"));
            label.htmlFor = id;
            label.textContent = labelText;
            result.appendChild(field);
            return result;
        },

        fieldSolutions: () => {
            const sortable = document.createElement("ul");
            sortable.classList.add("sortable");
            sortable.appendChild(this.DOM.li());
            sortable.appendChild(this.DOM.liNew());
            return this.DOM.field("Solutions", "solutions", sortable);
        },
        li: (txt = "", val = 1) => {
            const li = document.createElement("li");
            const solution = li.appendChild(document.createElement("input"));
            solution.type = "text";
            solution.name = "solution[]";
            solution.id = "solution[]";
            solution.value = txt;
            const value = li.appendChild(document.createElement("input"));
            value.type = "number";
            value.size = "3";
            value.name = "value[]";
            value.id = "value[]";
            value.value = val;
            const button = li.appendChild(document.createElement("button"));
            button.textContent = "➖︎";
            return li;
        },
        liNew: () => {
            const li = document.createElement("li");
            const solution = li.appendChild(document.createElement("input"));
            solution.type = "text";
            solution.name = "solution_new";
            solution.id = "solution_new";
            solution.value = "";
            solution.placeholder = "New Solution";
            li.appendChild(document.createElement("span"));
            const span = li.appendChild(document.createElement("span"));
            span.textContent = "➕︎";
            return li;
        },
    };

    /**
     * Event handlers for the Question component.
     * @type {Object}
     */
    static EVT = {
        ".selector": {
            /**
             * Event handler for the specified event.
             * @param {Event} e - The event object.
             */
            eventName: (e) => {
                // Event handler logic
            },
        },
    };
    slotEvt = {
        "": (e) => {
            console.log(this, 'Unnamed slot changed');
        },
        "name": (e) => {
            console.log(this, 'Slot "name" changed');
        }
    };

    /**
     * The observed attributes for the Question component.
     * @type {Object}
     */
    static observedProps = {
        'attribute': {
            /**
             * Setter function for the 'attribute' attribute.
             * @param {any} value - The new value of the attribute.
             */
            set: function (value) {
                // Setter logic
            },
        },
    };
};

/**
 * Initializes the Question component.
 */
Question.init(import.meta);