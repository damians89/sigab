<?php

namespace App\Exceptions;


use Symfony\Component\Debug\Exception\FlattenException;
use Exception;
use Illuminate\Foundation\Exceptions\Handler as ExceptionHandler;

class Handler extends ExceptionHandler
{
    /**
     * A list of the exception types that are not reported.
     *
     * @var array
     */
    protected $dontReport = [
        //
    ];

    /**
     * A list of the inputs that are never flashed for validation exceptions.
     *
     * @var array
     */
    protected $dontFlash = [
        'password',
        'password_confirmation',
    ];

    /**
     * Report or log an exception.
     *
     * This is a great spot to send exceptions to Sentry, Bugsnag, etc.
     *
     * @param  \Exception  $exception
     * @return void
     */
    public function report(Exception $exception)
    {
        parent::report($exception);
    }

    /**
     * Render an exception into an HTTP response.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Exception  $exception
     * @return \Illuminate\Http\Response
     */
   /** public function render($request, Exception $exception)
    {
        return parent::render($request, $exception);
    }*/
    public function render($request, Exception $e)
    {
        $exception =  FlattenException::create($e);
        //dd($e);
        
        $statusCode = $exception->getStatusCode($exception);

        if ($statusCode === 404 or $statusCode === 500 or $statusCode === 401 or $statusCode === 403 or $statusCode === 503 or $statusCode === 422) {
            return response()->view('errors.' . $statusCode, [], $statusCode);
        }
        return parent::render($request, $exception);
    }

}

