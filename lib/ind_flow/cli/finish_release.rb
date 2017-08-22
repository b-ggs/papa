module IndFlow
  class CLI::FinishRelease
    def initialize(version:)
      @version = version
    end

    def run
      release_branch_name = "release/#{@version}"

      queue = CommandQueue.new
      queue.add Git.checkout(branch_name: release_branch_name)
      queue.add Git.push(remote: 'origin', branch_name: release_branch_name)

      queue.list_queue
    end
  end
end
