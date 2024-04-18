<?php

namespace Modules\TaskManagement\DataTables;

use Illuminate\Database\Eloquent\Builder as QueryBuilder;
use Modules\TaskManagement\Entities\Task;
use Yajra\DataTables\EloquentDataTable;
use Yajra\DataTables\Html\Builder as HtmlBuilder;
use Yajra\DataTables\Html\Button;
use Yajra\DataTables\Html\Column;
use Yajra\DataTables\Services\DataTable;

class TaskDataTable extends DataTable
{
    /**
     * Build DataTable class.
     *
     * @param  QueryBuilder  $query  Results from query() method.
     */
    public function dataTable(QueryBuilder $query): EloquentDataTable
    {
        return (new EloquentDataTable($query))
            ->addColumn('action', function ($query) {
                $button = '<div class="d-flex align-items-center">';
                $button .= '<a href="javascript:void(0);" class="btn btn-info-soft btn-sm m-1" title="View" onclick="' . "axiosModal('" . route(\config('theme.rprefix') . '.show', $query->id) . '\')"><i class="fa fa-eye"></i></a>';
                $button .= '<a href="javascript:void(0);" class="btn btn-primary-soft btn-sm m-1" title="Edit" onclick="' . "axiosModal('" . route(\config('theme.rprefix') . '.edit', $query->id) . '\')"><i class="fa fa-edit"></i></a>';
                $button .= '<a href="#" class="btn btn-danger-soft btn-sm mx-1" onclick="delete_modal(\'' . route(\config('theme.rprefix') . '.destroy', $query->id) . '\')"  title="Delete"><i class="fa fa-trash"></i></a>';
                $button .= '</div>';

                return $button;
            })
            ->editColumn('is_active', function ($query) {
                return $query->is_completed == 1 ? '<span class="badge bg-success">Completed</span>' : '<span class="badge bg-danger">pending</span>';
            })
            ->setRowId('id')
            ->addIndexColumn()
            ->rawColumns(['is_active', 'action']);
    }

    /**
     * Get query source of dataTable.
     */
    public function query(Task $model): QueryBuilder
    {
        return $model->newQuery()->where('user_id', \auth()->id());
    }

    /**
     * Optional method if you want to use html builder.
     */
    public function html(): HtmlBuilder
    {
        return $this->builder()
            ->setTableId('task-table')
            ->columns($this->getColumns())
            ->minifiedAjax()
            ->dom("<'row mb-3'<'col-md-4'l><'col-md-4 text-center'B><'col-md-4'f>>rt<'bottom'<'row'<'col-md-6'i><'col-md-6'p>>><'clear'>")
            ->orderBy(4)
            ->parameters([
                'responsive' => true,
                'autoWidth' => false,
                'headerCallback' => 'function(thead, data, start, end, display) {
                    $(thead).addClass("table-success");
                }',
            ])
            ->buttons([
                Button::make('reset')->className('btn btn-success box-shadow--4dp btn-sm-menu'),
                Button::make('reload')->className('btn btn-success box-shadow--4dp btn-sm-menu'),
            ]);
    }

    /**
     * Get the dataTable columns definition.
     */
    public function getColumns(): array
    {
        return [
            Column::make('DT_RowIndex')->title(localize('SI'))->searchable(false)->orderable(false)->width(30)->addClass('text-center'),
            Column::make('title')->title(localize('Title'))->defaultContent('N/A'),
            Column::make('is_active')->title(localize('status')),
            Column::make('updated_at')->title(localize('Updated'))->defaultContent('N/A'),
            Column::computed('action')
                ->title(localize('Action'))
                ->searchable(false)
                ->exportable(false)
                ->printable(false)
                ->width(80)
                ->addClass('text-center'),
        ];
    }

    /**
     * Get filename for export.
     */
    protected function filename(): string
    {
        return 'task-' . date('YmdHis');
    }
}
