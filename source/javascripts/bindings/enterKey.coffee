keyTrapBindingFactory = (keyCode) ->
    {
        init: (element, value, bindings, data, context) ->
            newValue= ->
                {
                    keyup: (data, event) ->
                        if keyCode == event.keyCode
                            value().call(@, data, event)
                }

            ko.bindingHandlers.event.init(element, newValue, bindings, data, context)
    }

ENTER_KEY = 13
ESCAPE_KEY = 27

ko.bindingHandlers.enterKey = keyTrapBindingFactory(ENTER_KEY)
ko.bindingHandlers.escapeKey = keyTrapBindingFactory(ESCAPE_KEY)
