describe "task list view model", ->
    beforeEach ->
        @taskList = new App.ViewModels.TaskList()

    it "has an empty task list when initialized", ->
        expect(@taskList.items()).toEqual([])

    it "has an observable input for new tasks", ->
        @taskList.newTaskInput("Some task")
        expect(@taskList.newTaskInput()).toEqual("Some task")

    describe "adding an item", ->
        beforeEach ->
            @taskList.newTaskInput("My Item")
            @taskList.addItem()

        it "adds it to the list of items", ->
            expect(@taskList.items().length).toEqual(1)

        it "adds it as a Task model", ->
            item = @taskList.items()[0]
            expect(item.title()).toEqual("My Item")

        it "clears the new task input field", ->
            expect(@taskList.newTaskInput()).toEqual("")
