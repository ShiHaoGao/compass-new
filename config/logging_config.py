import os
import logging
import logging.handlers
from datetime import datetime
from colorlog import ColoredFormatter

def setup_logging(
    log_dir="logs",
    log_level=logging.INFO,
    rotation_size=10 * 1024 * 1024,  # 10MB
    backup_count=5
):
    """
    Setup project-wide logging configuration with colored console output
    
    Args:
        log_dir (str): Directory to store log files
        log_level (int): Logging level (default: logging.INFO)
        rotation_size (int): Size in bytes before log rotation
        backup_count (int): Number of backup files to keep
    """
    
    # Create logs directory if it doesn't exist
    if not os.path.exists(log_dir):
        os.makedirs(log_dir)
    
    # Generate log filename with timestamp
    timestamp = datetime.now().strftime('%Y%m%d%H%M%S')
    log_filename = os.path.join(log_dir, f'app_{timestamp}.log')
    
    # Create formatters
    file_formatter = logging.Formatter(
        '%(asctime)s | %(levelname)-8s | %(name)s | %(filename)s:%(lineno)d | %(message)s'
    )
    
    # Color configuration for console output
    console_formatter = ColoredFormatter(
        "%(log_color)s%(asctime)s | %(levelname)-8s%(reset)s | "
        "%(name)s | %(message_log_color)s%(message)s",
        datefmt=None,
        reset=True,
        log_colors={
            'DEBUG':    'blue',
            'INFO':     'green',
            'WARNING':  'yellow',
            'ERROR':    'red',
            'CRITICAL': 'red,bg_white',
        },
        secondary_log_colors={
            'message': {
                'DEBUG':    'blue',
                'INFO':     'green',
                'WARNING':  'yellow',
                'ERROR':    'red',
                'CRITICAL': 'red'
            }
        },
        style='%'
    )
    
    # Setup file handler with rotation
    file_handler = logging.handlers.RotatingFileHandler(
        filename=log_filename,
        maxBytes=rotation_size,
        backupCount=backup_count,
        encoding='utf-8'
    )
    file_handler.setFormatter(file_formatter)
    file_handler.setLevel(log_level)
    
    # Setup console handler with colors
    console_handler = logging.StreamHandler()
    console_handler.setFormatter(console_formatter)
    console_handler.setLevel(log_level)
    
    # Configure root logger
    root_logger = logging.getLogger()
    root_logger.setLevel(log_level)
    
    # Remove existing handlers to avoid duplicate logs
    root_logger.handlers = []
    
    root_logger.addHandler(file_handler)
    root_logger.addHandler(console_handler)
    
    # Log startup message
    root_logger.info("Logging system initialized with colored output")
    
if __name__ == "__main__":
    # Setup logging
    setup_logging(log_level=logging.DEBUG)
    logger = logging.getLogger(__name__)
    
    # Test different log levels with colors
    logger.debug("这是一条调试信息 - Cyan色")
    logger.info("这是一条普通信息 - Green色")
    logger.warning("这是一条警告信息 - Yellow色")
    logger.error("这是一条错误信息 - Red色")
    logger.critical("这是一条严重错误信息 - Red色带白色背景")
    
    # Test exception logging
    try:
        raise ValueError("示例异常")
    except Exception as e:
        logger.exception("捕获到一个异常")