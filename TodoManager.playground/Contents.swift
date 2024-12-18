import Foundation

// 할 일을 나타내는 구조체
struct Todo {
    let id: UUID = UUID()
    var title: String
    var isCompleted: Bool
}

// Todo 관리 클래스
class TodoManager {
    private var todos: [Todo] = []

    // 할 일 추가
    func addTodo(_ title: String) {
        let newTodo = Todo(title: title, isCompleted: false)
        todos.append(newTodo)
    }

    // 완료된 할 일 필터링
    func completedTodos() -> [Todo] {
        return todos.filter { $0.isCompleted }
    }

    // 특정 할 일을 완료 상태로 변경
    func markTodoAsCompleted(id: UUID) {
        if let index = todos.firstIndex(where: { $0.id == id }) {
            todos[index].isCompleted = true
        }
    }

    // 전체 할 일 개수 및 완료 비율
    func stats() -> (total: Int, completed: Int, completionRate: Double) {
        let total = todos.count
        let completed = todos.filter { $0.isCompleted }.count
        let completionRate = total > 0 ? Double(completed) / Double(total) : 0.0
        return (total, completed, completionRate)
    }

    // 모든 할 일 출력 (테스트용)
    func printTodos() {
        for todo in todos {
            print("\(todo.title) - \(todo.isCompleted ? "완료됨" : "미완료")")
        }
    }
}

// 테스트
let todoManager = TodoManager()

// 1. 할 일 추가
todoManager.addTodo("스위프트 공부하기")
todoManager.addTodo("운동하기")
todoManager.addTodo("책 읽기")

// 2. 특정 할 일을 완료 처리
if let firstTodoID = todoManager.completedTodos().first?.id {
    todoManager.markTodoAsCompleted(id: firstTodoID)
}

// 3. 완료된 할 일 출력
print("완료된 할 일:")
for todo in todoManager.completedTodos() {
    print(todo.title)
}

// 4. 통계 출력
let stats = todoManager.stats()
print("전체 할 일: \(stats.total), 완료된 할 일: \(stats.completed), 완료 비율: \(stats.completionRate * 100)%")

// 5. 모든 할 일 출력
print("전체 할 일 목록:")
todoManager.printTodos()
