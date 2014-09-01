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

    it "has an observable editing flag", ->
        @task.editing(true)
        expect(@task.editing()).toBe(true)

    it "sets the editing flag to false by default", ->
        expect(@task.editing()).toBe(false)

    describe "initialized with data", ->
        beforeEach ->
            @task = new App.Models.Task({
                title: "Task #1",
                completed: true,
                editing: true
            })

        it "sets the title", ->
            expect(@task.title()).toEqual("Task #1")

        it "sets the completion flag", ->
            expect(@task.completed()).toBe(true)

        it "ignores the editing flag", ->
            expect(@task.editing()).toBe(false)
