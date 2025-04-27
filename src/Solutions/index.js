import SortableInput from "../SortableInput/index.js";

/**
 * Represents the Solutions
 *  component.
 * @extends Formponent
 */
export default class Solutions extends SortableInput{
    /**
     * The tag name of the Solutions component.
     * @type {string}
     */
    static tagName = 'solutions-ponent';

    /**
     * The template file for the Solutions component. (optional)
     * @type {string}
     */
    // static templateUrl = 'index.tpl';
	static styleUrl = "style.css";

    constructor() {
        super();
        console.log(this.DOM);
    }

    /**
     * Called when the Solutions component is connected to the DOM.
     * @override
     */
    connectedCallback() {
        super.connectedCallback();
        this.shadowRoot.appendChild(document.createElement('slot'));
        return;
    }
    static DOM = {
        input: () => {
            alert("input");
            const result = document.createElement("fieldset");
            const solution = result.appendChild(document.createElement("input"));
            solution.type = "text";
            solution.name = "solution[]";
            const value = result.appendChild(document.createElement("input"));
            value.type = "number";
            value.size = "2";
            value.name = "value[]";
            return result;
        },
    };
}

/**
 * Initializes the Solutions component.
 */
Solutions.init(import.meta);
