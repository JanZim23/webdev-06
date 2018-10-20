defmodule Task1.TasksTest do
  use Task1.DataCase

  alias Task1.Tasks

  describe "tasks" do
    alias Task1.Tasks.Task

    @valid_attrs %{created: 42, desc: "some desc", done: true, name: "some name", owner: 42, time: 42}
    @update_attrs %{created: 43, desc: "some updated desc", done: false, name: "some updated name", owner: 43, time: 43}
    @invalid_attrs %{created: nil, desc: nil, done: nil, name: nil, owner: nil, time: nil}

    def task_fixture(attrs \\ %{}) do
      {:ok, task} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tasks.create_task()

      task
    end

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert Tasks.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert Tasks.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      assert {:ok, %Task{} = task} = Tasks.create_task(@valid_attrs)
      assert task.created == 42
      assert task.desc == "some desc"
      assert task.done == true
      assert task.name == "some name"
      assert task.owner == 42
      assert task.time == 42
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tasks.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      assert {:ok, %Task{} = task} = Tasks.update_task(task, @update_attrs)

      
      assert task.created == 43
      assert task.desc == "some updated desc"
      assert task.done == false
      assert task.name == "some updated name"
      assert task.owner == 43
      assert task.time == 43
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = Tasks.update_task(task, @invalid_attrs)
      assert task == Tasks.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = Tasks.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> Tasks.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = Tasks.change_task(task)
    end
  end
end
