describe "key trap binding handlers", ->
    ENTER_KEY = 13
    ESCAPE_KEY = 27
    ANY_KEY = 50

    triggerKeyup = (node, keyCode) ->
        e = $.Event("keyup")
        e.which = e.keyCode = keyCode
        node.trigger(e);

    describe "enterKey", ->
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
            triggerKeyup(@testNode, ENTER_KEY)
            expect(@model.wasCalled).toBe(true)

        it "does not call specified event if any other key is pressed", ->
            expect(@model.wasCalled).toBe(false)
            ko.applyBindings(@model, @testNode[0])
            triggerKeyup(@testNode, ANY_KEY)
            expect(@model.wasCalled).toBe(false)

    describe "escapeKey", ->
        beforeEach ->
            @testNode = $("<input data-bind='escapeKey:doCall' />")
            @model = {
                wasCalled: false
                doCall: ->
                    @wasCalled = true
            }

        it "is registered", ->
            expect(ko.bindingHandlers.escapeKey).not.toBeUndefined()

        it "calls specified event if escape key is pressed", ->
            expect(@model.wasCalled).toBe(false)
            ko.applyBindings(@model, @testNode[0])
            triggerKeyup(@testNode, ESCAPE_KEY)
            expect(@model.wasCalled).toBe(true)

        it "does not call specified event if any other key is pressed", ->
            expect(@model.wasCalled).toBe(false)
            ko.applyBindings(@model, @testNode[0])
            triggerKeyup(@testNode, ANY_KEY)
            expect(@model.wasCalled).toBe(false)
