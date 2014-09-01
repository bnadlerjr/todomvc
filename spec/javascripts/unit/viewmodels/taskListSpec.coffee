describe "task list view model", ->
    beforeEach ->
        @taskList = new App.ViewModels.TaskList()

    it "has an empty task list when initialized", ->
        expect(@taskList.items()).toEqual([])

    it "has an observable input for new tasks", ->
        @taskList.newTaskInput("Some task")
        expect(@taskList.newTaskInput()).toEqual("Some task")

    it "is visible if there are items in list", ->
        task = new App.Models.Task({title: "My Task"})
        @taskList.items([task])
        expect(@taskList.isVisible()).toBe(true)

    it "is invisible if list is empty", ->
        expect(@taskList.isVisible()).toBe(false)

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

        it "trims whitespace from title", ->
            @taskList.newTaskInput("   item with whitespace   ")
            @taskList.addItem()
            item = @taskList.items()[1]
            expect(item.title()).toEqual("item with whitespace")

        it "does not add blank items", ->
            @taskList.newTaskInput("")
            @taskList.addItem()
            expect(@taskList.items().length).toEqual(1)

    describe "removing an item", ->
        it "deletes the item from the list", ->
            task = new App.Models.Task({title: "My Task"})
            @taskList.items([task])
            @taskList.removeItem(task)
            expect(@taskList.items()).toEqual([])
