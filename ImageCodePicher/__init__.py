from .ImageCodePicher import ImageCodePicher
from .version import VERSION

_version_ = VERSION

class ImageCodePicher(ImageCodePicher):
    ROBOT_LIBRARY_SCOPE = 'GLOBAL'