from django.shortcuts import render
from carpl.utils import process_image


def index(request):
    context = None
    if request.POST:
        xray_image = request.FILES['xray_image'] if\
            'xray_image' in request.FILES else False
        if xray_image:
            process_image(xray_image)
            context = {
                'status': 'File found'
            }
        else:
            context = {
                'status': 'Please select an image file.'
            }
    return render(request, 'carpl/index.html', context)
