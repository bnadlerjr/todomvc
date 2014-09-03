describe "task list view model", ->
    beforeEach ->
        @taskList = new App.ViewModels.TaskList()
        @task = new App.Models.Task({title: "My Task"})

    it "has an empty task list when initialized", ->
        expect(@taskList.items()).toEqual([])

    it "has an observable input for new tasks", ->
        @taskList.newTaskInput("Some task")
        expect(@taskList.newTaskInput()).toEqual("Some task")

    it "is visible if there are items in list", ->
        @taskList.items([@task])
        expect(@taskList.isVisible()).toBe(true)

    it "is invisible if list is empty", ->
        expect(@taskList.isVisible()).toBe(false)

    it "can report the number of incomplete items", ->
        @taskList.items([
            new App.Models.Task({title: "Task #1"})
            new App.Models.Task({title: "Task #2"})
            new App.Models.Task({title: "Task #3"})
        ])

        expect(@taskList.numberIncomplete()).toEqual(3)
        @taskList.items()[0].completed(true)
        expect(@taskList.numberIncomplete()).toEqual(2)

    it "can report the number of completed items", ->
        @taskList.items([
            new App.Models.Task({title: "Task #1"})
            new App.Models.Task({title: "Task #2"})
            new App.Models.Task({title: "Task #3"})
        ])

        expect(@taskList.numberCompleted()).toEqual(0)
        @taskList.items()[0].completed(true)
        expect(@taskList.numberCompleted()).toEqual(1)

    describe "item count text", ->
        it "is singular if there is one item", ->
            @taskList.items([new App.Models.Task({title: "Task #1"})])
            expect(@taskList.itemCountText()).toEqual("item")

        it "is plural if there are more than one items", ->
            @taskList.items([
                new App.Models.Task({title: "Task #1"})
                new App.Models.Task({title: "Task #2"})
            ])
            expect(@taskList.itemCountText()).toEqual("items")

        it "is plural if there are zero items", ->
            @taskList.items([])
            expect(@taskList.itemCountText()).toEqual("items")

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

    describe "removing items", ->
        it "removes any specific item", ->
            @taskList.items([@task])
            @taskList.removeItem(@task)
            expect(@taskList.items()).toEqual([])

        it "removes all completed items", ->
            @taskList.items([
                @task,
                new App.Models.Task({title: "Another task", completed: true})
            ])
            @taskList.removeCompleted()
            expect(@taskList.items()).toEqual([@task])

    describe "editing an item", ->
        beforeEach ->
            @taskList.items([@task])
            @taskList.editItem(@task)

        describe "edit mode", ->
            it "sets the edit flag to true", ->
                expect(@task.editing()).toEqual(true)

            it "stores the unedited title", ->
                expect(@task.previousTitle).toEqual("My Task")

        describe "canceling edit mode", ->
            beforeEach ->
                @task.title("edited title")
                @taskList.cancelEditingItem(@task)

            it "sets the edit flag to false", ->
                expect(@task.editing()).toBe(false)

            it "restores the task title", ->
                expect(@task.title()).toEqual("My Task")

        describe "saving changes", ->
            it "sets editing flag to false", ->
                @task.title("edited title")
                @taskList.saveEditedItem(@task)
                expect(@task.editing()).toBe(false)

            it "updates the title", ->
                @task.title("edited title")
                @taskList.saveEditedItem(@task)
                expect(@task.title()).toEqual("edited title")

            it "trims the title before updating", ->
                @task.title("     edited title     ")
                @taskList.saveEditedItem(@task)
                expect(@task.title()).toEqual("edited title")

            it "removes the item if the title is blank", ->
                @task.title("")
                @taskList.saveEditedItem(@task)
                expect(@taskList.items().length).toEqual(0)

    describe "filtering items", ->
        beforeEach ->
            @taskList.items([
                new App.Models.Task({title: "Task #1", completed: false}),
                new App.Models.Task({title: "Task #2", completed: false}),
                new App.Models.Task({title: "Task #3", completed: true}),
                new App.Models.Task({title: "Task #4", completed: true}),
                new App.Models.Task({title: "Task #5", completed: true})
            ])

        it "by completed", ->
            @taskList.filterBy("completed")
            expect(@taskList.filteredItems().length).toEqual(3)

        it "by active", ->
            @taskList.filterBy("active")
            expect(@taskList.filteredItems().length).toEqual(2)

        it "by all", ->
            @taskList.filterBy("all")
            expect(@taskList.filteredItems().length).toEqual(5)

        it "by unknown filter raises an error", ->
            expect(=> @taskList.filterBy("foo")).toThrow("Unsupported filter (foo).")

    describe "persistence", ->
        it "saves to local storage when task list is updated", ->
            localStorage.removeItem("todomvc-test")
            @taskList.items([@task])
            expected = '[{"title":"My Task","completed":false}]'
            expect(localStorage["todomvc"]).toEqual(expected)
