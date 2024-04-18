<?php

namespace Modules\TaskManagement\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Modules\TaskManagement\Entities\Task;
use Illuminate\Contracts\Support\Renderable;
use Modules\TaskManagement\DataTables\TaskDataTable;

class TaskManagementController extends Controller
{
    /**
     * Constructor for the controller.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware(['auth', 'verified']);
        $this->middleware('request:ajax', ['only' => ['create', 'store', 'edit', 'update', 'destroy']]);
        $this->middleware('strip_scripts_tag')->only(['store', 'update']);
        \cs_set('theme', [
            'title' => 'Task Lists',
            'back' => \back_url(),
            'breadcrumb' => [
                [
                    'name' => 'Dashboard',
                    'link' => route('admin.dashboard'),
                ],
                [
                    'name' => 'Task Lists',
                    'link' => false,
                ],
            ],
            'rprefix' => 'admin.task',
        ]);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(TaskDataTable $dataTable)
    {
        \cs_set('theme', [
            'description' => 'Display a listing of task in Database.',
        ]);

        return $dataTable->render('taskmanagement::index');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('taskmanagement::create_edit')->render();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $data = $request->validate([
            'title' => 'required|string|max:255',
            'description' => 'required|string',
            'is_completed' => 'required|boolean',
        ]);
        $data['user_id'] = \auth()->id();
        $item = Task::create($data);

        return response()->success($item, localize('Task Created Successfully'), 201);
    }

    /**
     * Show the specified resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function show(Task $task)
    {

        cs_set('theme', [
            'title' => 'Task Details',
        ]);

        return view('taskmanagement::show', ['item' => $task])->render();
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @return \Illuminate\View\View
     */
    public function edit(Task $task)
    {
        return view('taskmanagement::create_edit', ['item' => $category])->render();
    }

    /**
     * Update the specified resource in storage.
     *
     * @return \Illuminate\Http\Response
     */
    public function update(Task $category, Request $request)
    {
        $data = $request->validate([
            'title' => 'required|string|max:255',
            'description' => 'required|string',
            'is_completed' => 'required|boolean',
        ]);
        $category->update($data);

        return response()->success($category, 'Task Updated Successfully.', 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @return \Illuminate\Http\Response
     */
    public function destroy(Task $category)
    {
        $category->delete();
        return response()->success(null, 'Task Deleted Successfully.', 200);
    }
}
