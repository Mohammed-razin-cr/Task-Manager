#!/bin/bash
echo " -----------------Welcome-------------------"

tasks_file="$HOME/tasks.txt"

function show_menu() {
    echo "===== Task Manager Menu ====="
    echo "1. Add Task"
    echo "2. View Tasks"
    echo "3. Mark Task as Completed"
    echo "4. Exit"
    echo "============================="
}

function add_task() {
    read -p "Enter task: " new_task
    echo "$new_task [ ]" >> "$tasks_file"
    echo "Task added successfully!"
}

function view_tasks() {
    echo "===== Current Tasks ====="
    cat "$tasks_file" || echo "No tasks available."
    echo "=========================="
}

function mark_completed() {
    view_tasks
    read -p "Enter task number to mark as completed: " task_number
    sed -i "${task_number}s/\[ \]/\[X\]/" "$tasks_file"
    echo "Task marked as completed!"
}

while true; do
    show_menu

    read -p "Select an option (1-4): " choice

    case $choice in
        1)
            add_task
            ;;
        2)
            view_tasks
            ;;
        3)
            mark_completed
            ;;
        4)
            echo "Exiting Task Manager. Goodbye!"
            exit 0
            ;;
        *)
            echo "Invalid option. Please choose a number from 1 to 4."
            ;;
    esac

    read -p "Press Enter to continue..."
done