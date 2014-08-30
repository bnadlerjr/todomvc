describe "task list view model", ->
    it "has an empty task list when initialized", ->
        taskList = new App.ViewModels.TaskList()
        expect(taskList.items()).toEqual([])

    it "can add a task item", ->
        taskList = new App.ViewModels.TaskList()
        taskList.add_item("My Item")
        expect(taskList.items().length).toEqual(1)
        item = taskList.items()[0]
        expect(item.title()).toEqual("My Item")
