describe "enterKey binding handler", ->
    beforeEach ->
        @testNode = $("<input data-bind='enterKey:doCall' />")
        @model = {
            wasCalled: false
            doCall: ->
                @wasCalled = true
        }

    it "is registered", ->
        expect(ko.bindingHandlers.enterKey).not.toBeUndefined()

    it "calls specified event if enter key is pressed", ->
        expect(@model.wasCalled).toBe(false)
        ko.applyBindings(@model, @testNode[0])
        triggerKeyup(@testNode, 13)
        expect(@model.wasCalled).toBe(true)

    it "does not call specified event if any other key is pressed", ->
        expect(@model.wasCalled).toBe(false)
        ko.applyBindings(@model, @testNode[0])
        triggerKeyup(@testNode, 50)
        expect(@model.wasCalled).toBe(false)

    triggerKeyup = (node, keyCode) ->
        e = jQuery.Event("keyup")
        e.which = e.keyCode = keyCode
        node.trigger(e);
