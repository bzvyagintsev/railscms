import Stickyfill from './stickyfill.js';

export default function() {
    $(document).ready(function() {
        $('#sticky-sidebar').Stickyfill();
    })
};
