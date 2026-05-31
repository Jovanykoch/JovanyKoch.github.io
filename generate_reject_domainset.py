#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Generate reject.txt DOMAIN-SET format file for Surge
用于生成 Surge 拒绝规则集的脚本
"""

import os
from pathlib import Path
from typing import List

def load_domains_from_source(source_file: str) -> List[str]:
    """
    Load domain list from source files
    从源文件加载域名列表
    """
    domains = []
    if os.path.exists(source_file):
        with open(source_file, 'r', encoding='utf-8') as f:
            for line in f:
                # Strip whitespace and skip empty lines and comments
                # 移除空格并跳过空行和注释
                line = line.strip()
                if line and not line.startswith('#'):
                    domains.append(line)
    return domains

def generate_reject_domainset(
    domains: List[str], 
    output_path: str, 
    title: str = "Reject Domains"
) -> None:
    """
    Generate reject.txt in DOMAIN-SET format
    生成 DOMAIN-SET 格式的 reject.txt 文件
    
    Args:
        domains: List of domains to reject
        output_path: Output file path
        title: Title/description for the domain set
    """
    # Create output directory if it doesn't exist
    # 如果输出目录不存在，则创建它
    os.makedirs(os.path.dirname(output_path), exist_ok=True)
    
    # Remove duplicates and sort domains
    # 去重并排序域名
    unique_domains = sorted(set(domains))
    
    with open(output_path, 'w', encoding='utf-8') as f:
        # Write header comment
        # 写入头部注释
        f.write(f"# {title}\n")
        f.write("# Surge DOMAIN-SET Format\n")
        f.write(f"# Total domains: {len(unique_domains)}\n")
        f.write("# Last updated: 2026-05-31\n\n")
        
        # Write domains to file
        # 将域名写入文件
        for domain in unique_domains:
            f.write(f"{domain}\n")
    
    print(f"✓ Generated {output_path} with {len(unique_domains)} domains")

def main():
    """
    Main execution function
    主执行函数
    """
    # Define paths
    # 定义路径
    base_path = "surge-china/domainset"
    output_file = os.path.join(base_path, "reject.txt")
    
    # Define domains to reject
    # 定义需要拒绝的域名列表
    reject_domains = [
        # Advertising networks / 广告网络
        "ads.google.com",
        "pagead2.googlesyndication.com",
        "doubleclick.net",
        "adservice.google.com",
        
        # Tracking domains / 追踪域名
        "google-analytics.com",
        "analytics.google.com",
        "mixpanel.com",
        "segment.com",
        
        # Other reject domains
        # 其他拒绝的域名
        "example-ad-domain.com",
    ]
    
    # Generate reject domainset
    # 生成拒绝域名集
    generate_reject_domainset(
        domains=reject_domains,
        output_path=output_file,
        title="Reject - Advertisement & Tracking Domains"
    )

if __name__ == "__main__":
    main()
