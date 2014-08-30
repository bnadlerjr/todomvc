describe "task model", ->
    beforeEach ->
        @task = new App.Models.Task()

    it "has an observable title", ->
        @task.title("My Task")
        expect(@task.title()).toEqual("My Task")

    it "has an observable completion flag", ->
        @task.completed(true)
        expect(@task.completed()).toBe(true)

    it "sets the completion flag to false by default", ->
        expect(@task.completed()).toBe(false)

    describe "initialized with data", ->
        beforeEach ->
            @task = new App.Models.Task({title: "Task #1", completed: true})

        it "sets the title", ->
            expect(@task.title()).toEqual("Task #1")

        it "sets the completion flag", ->
            expect(@task.completed()).toBe(true)
