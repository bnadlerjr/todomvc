describe "widget", ->
    it "has a name", ->
        widget = new App.Widget("foo")
        expect(widget.name).toEqual("foo")
